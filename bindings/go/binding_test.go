package tree_sitter_simplelisp_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-simplelisp"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_simplelisp.Language())
	if language == nil {
		t.Errorf("Error loading Simplelisp grammar")
	}
}
