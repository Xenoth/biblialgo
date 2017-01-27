#include "tree.h"

struct tree_node {
  int value;
  struct tree_node *left;
  struct tree_node *right;
};

void tree_create(struct tree *self) {
	self->root=NULL;
}

void tree_destroy(struct tree *self) {
	tree_destroy_node(self->root);
}

void tree_destroy_node(struct tree_node *self)
{
	if (self)
	{
		tree_destroy_node(self->right);
		self->right=NULL;
		tree_destroy_node(self->left);
		self->left=NULL;
		free(self);
	}
}

bool tree_contains(const struct tree *self, int value) {
	return tree_contains_node(self->root,value);
}

bool tree_contains_node(struct tree_node  *self, int value) {
	if (self == NULL) {
		return false;
	}
	if (value < self->value) {
		return tree_contains_node(self->left, value);
	}
	if (value > self->value) {
		return tree_contains_node(self->right, value);
	}
	return true;
}

void tree_insert(struct tree *self, int value) {
	self->root=tree_insert_node(self->root, value);
}

struct tree_node *tree_insert_node(struct tree_node *self, int value){
	if (self == NULL)
	{
		struct tree_node *node = malloc(sizeof(struct tree_node ));
		node->left = node->right = NULL; 
		node->value = value;
		return node;
	}
	if (value < self->value)
	{
		self->left=tree_insert_node(self->left, value);
	}
	if (value > self->value)
	{
		self->right=tree_insert_node(self->right, value);
	}
	return self;
}

void tree_remove(struct tree *self, int value) {
	self->root=tree_remove_node(self->root, value);
}

struct tree_node *tree_remove_node(struct tree_node *self, int value) {
	if (self == NULL)
	{
		return NULL;
	}
	if (value < self->value)
	{
		self->left = tree_remove_node(self->left, value);
		return self;
	}
	if (value > self->value)
	{
		self->right = tree_remove_node(self->right, value);
		return self;
	}
	return tree_node_delete(self);
}


struct tree_node *tree_node_delete(struct tree_node *self){
	struct tree_node *left = self->left;
	struct tree_node *right = self->right;
	free(self);
	self = NULL;
	if (left == NULL && right == NULL)
	{
		return NULL;
	}
	if (left == NULL)
	{
		return right;
	}
	if (right == NULL)
	{
		return left;
	}
	right = tree_node_delete_minimum(right, &self);
	self->left = left;
	self->right = right;
	return self;
}

struct tree_node *tree_node_delete_minimum(struct tree_node *self, struct tree_node **min) {
	if (self->left == NULL)
	{
		struct tree_node *right = self->right;
		self->right = NULL;
		*min = self;
		return right;
	}
	self->left = tree_node_delete_minimum(self->left, min);
	return self;
}

bool tree_is_empty(const struct tree *self) {
	return (!self->root);
}

size_t tree_size(const struct tree *self) {
	return tree_size_node(self->root);
}

int tree_size_node(struct tree_node* self) 
{  
	if (!self) 
		return 0;
	else    
		return(tree_size_node(self->left) + 1 + tree_size_node(self->right));  
}

size_t tree_height(const struct tree *self) {
	return tree_height_node(self->root);
}

int tree_height_node(struct tree_node *self)
{ 
	int height_left, height_right;
	if (!self)
		return 0;

	height_left = tree_height_node(self->left);
	height_right = tree_height_node(self->right);

	return 1 + ((height_left > height_right) ? height_left : height_right);
}

void tree_walk_pre_order(const struct tree *self, tree_func_t func, void *user_data)  {

}

void tree_walk_in_order(const struct tree *self, tree_func_t func, void *user_data) {

}

void tree_walk_post_order(const struct tree *self, tree_func_t func, void *user_data) {

}

void tree_dump(const struct tree *self) {
  
}
