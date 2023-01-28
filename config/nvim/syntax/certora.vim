" Vim syntax file
" Language: Certora Verification Language
" Maintainer: Martin Chrzanowski
" Latest Revision: 16 July 2021

if exists("b:current_syntax")
  finish
endif

syn keyword statement methods description good_description rule maintain assume invariant preserved pragma ghost using as
syn keyword keyword havoc static_assert invoke assert at assuming axiom sinvoke static_require require if else requireInvariant returns envfree

syn keyword type env address uint256 bool method calldataarg uint uint64 uint16 uint32 uint8 uint24 uint32 uint40 uint48 uint56 uint72 uint80 uint88 uint96 uint104 uint112 uint120 uint128 uint136 uint144 uint152 uint160 uint168 uint176 uint184 uint192 uint200 uint208 uint216 uint224 uint232 uint240 uint248 string bytes bytes1 bytes2 bytes3 bytes4 bytes5 bytes6 bytes7 bytes8 bytes9 bytes10 bytes11 bytes12 bytes13 bytes14 bytes15 bytes16 bytes17 bytes18 bytes19 bytes20 bytes21 bytes22 bytes23 bytes24 bytes25 bytes26 bytes27 bytes28 bytes29 bytes30 bytes31 bytes32


syn keyword identifier lastReverted lastHasThrown lastStorage lastEvents lastNumEvents currentContract
syn match constant /"[^"]*"/

syn match operator /=>/
syn match operator /<=>/
syn match operator /!/
syn match operator /+/
syn match operator /\*/
syn match operator /-/
syn match operator /==/
syn match operator /<=\?/
syn match operator />=\?/
syn match operator /!=/

syn match comment /\/\/.*$/
syn region comment start="\/\*" end="\*\/"

let b:current_syntax = "certora"
