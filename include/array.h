#ifndef ARRAY_H
#define ARRAY_H

#include <stddef.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>

#ifdef __cplusplus
extern "C" {
#endif

struct array {
  int *data;
  size_t capacity;
  size_t size;
};

/*
 * Create an empty array
 */
void array_create(struct array *self);

/*
 * Destroy an array
 */
void array_destroy(struct array *self);

/*
 * Compare the array to another array (content and size)
 */
bool array_equals(const struct array *self, const int *content, size_t size);

/*
 * Add an element at the end of the array
 */
void array_add(struct array *self, int value);

/*
 * Insert an element in the array (preserving the order)
 */
void array_insert(struct array *self, int value, size_t index);

/*
 * Remove an element in the array (preserving the order)
 */
void array_remove(struct array *self, size_t index);

/*
 * Get a pointer to the element at the specified index in the array
 */
int *array_get(const struct array *self, size_t index);

/*
 * Tell if the array is empty
 */
bool array_is_empty(const struct array *self);

/*
 * Get the size of the array
 */
size_t array_size(const struct array *self);

/*
 * Search for an element in the array.
 */
size_t array_search(const struct array *self, int value);

/*
 * Search for an element in the sorted array.
 */
size_t array_search_sorted(const struct array *self, int value);

/*
 * Import an array
 */
void array_import(struct array *self, const int *other, size_t size);

/*
 * Print an array to stdout
 */
void array_dump(const struct array *self);

/*
 * Tell if the array is sorted
 */
bool array_is_sorted(const struct array *self);

/*
 * Swap two value in an array
 */
void array_swap(int *data, size_t i, size_t j);

/*
 * Sort the array with selection sort
 */
void array_selection_sort(struct array *self);

/*
 * Sort the array with bubble sort
 */
void array_bubble_sort(struct array *self);

/*
 * Sort the array with insertion sort
 */
void array_insertion_sort(struct array *self);

/*
 * Sort the array with quick sort
 */
void array_quick_sort(struct array *self);

void array_quick_sort_partial(int *data, ssize_t i, ssize_t j);
ssize_t array_partition(int *data, ssize_t i, ssize_t j);


/*
 * Sort the array with heap sort
 */
void array_heap_sort(struct array *self);
void heap_insert(int *heap, size_t n, int value);
/*
 * Tell if the array is a heap
 */
bool array_is_heap(const struct array *self);

bool isHeap(int *arr, int i, int n);

/*
 * Add a value into the array considered as a heap
 */
void array_heap_add(struct array *self, int value);

/*
 * Get the value at the top of the heap
 */
int array_heap_top(const struct array *self);

void heap_remove_max(int *heap, size_t n);

/*
 * Remove the top value in the array considered as a heap
 */
void array_heap_remove_top(struct array *self);


#ifdef __cplusplus
}
#endif

#endif // ARRAY_H
