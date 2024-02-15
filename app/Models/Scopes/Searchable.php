<?php

namespace App\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;

trait Searchable
{
    /**
     * Search paginated items ordering by ID descending
     */
    public function scopeSearchLatestPaginated(
        Builder $query,
        string $search,
        int $paginationQuantity = 10
    ): Builder {
        return $query
            ->search($search)
            ->orderBy('updated_at', 'desc')
            ->paginate($paginationQuantity);
    }

    /**
     * Adds a scope to search the table based on the
     * $searchableFields array inside the model
     */
    // public function scopeSearch(Builder $query, string $search): Builder
    // {
    //     $query->where(function ($query) use ($search) {
    //         foreach ($this->getSearchableFields() as $field) {
    //             $query->orWhere($field, 'like', "%{$search}%");
    //         }
    //     });

    //     return $query;
    // }

    public function scopeSearch(Builder $query, string $search): Builder
    {
        if (empty($search)) {
            return $query;
        }

        return $query->where(function ($query) use ($search) {
            // Búsqueda específica para el modelo Entrada
            if (isset($this->searchEntradaRelations) && $this->searchEntradaRelations === true) {
                $query->orWhereHas('producto', function ($subQuery) use ($search) {
                    $subQuery->where('nombre', 'like', "%{$search}%");
                });
            }

            // Búsqueda en campos locales definidos en $searchableFields o en todos si '*' está presente
            foreach ($this->getSearchableFields() as $field) {
                if ($field === '*') {
                    continue; // Omitir, la lógica para manejar '*' debe ser implementada si es necesario
                }
                $query->orWhere($field, 'like', "%{$search}%");
            }
        });
    }

    /**
     * Returns the searchable fields. If $searchableFields is undefined,
     * or is an empty array, or its first element is '*', it will search
     * in all table fields
     */
    protected function getSearchableFields(): array
    {
        if (isset($this->searchableFields) && count($this->searchableFields)) {
            return $this->searchableFields[0] === '*'
                ? $this->getAllModelTableFields()
                : $this->searchableFields;
        }

        return $this->getAllModelTableFields();
    }

    /**
     * Gets all fields from Model's table
     */
    protected function getAllModelTableFields(): array
    {
        $tableName = $this->getTable();

        return $this->getConnection()
            ->getSchemaBuilder()
            ->getColumnListing($tableName);
    }
}
