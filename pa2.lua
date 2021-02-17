#!/usr/bin/env lua
-- pa2.lua
-- Yali Wang
-- Started: 2021-02-04
-- Updated: 2021-02-09
--
-- For CS F331 Spring 2021 Assignment 2 Exercise 2
-- Lua Module
-- Not a complete program
-- Contains functions dealing with tables, strings, and numbers. 
-- One of the functions will return an iterator. Another will be a coroutine.

local pa2 = {} -- Module table

-- 1. Function filterArray
--    Function p can be assumed to be a one-parameter function that will accept any value in array t
--    filterArray returns an array containing every value v in t for which p(v) is truthy, 
--    in the same order as they appear in t.

function pa2.filterArray(p,t)
  local filter = {}
    for k = 1, #t
    do
      if p(t[k]) then
        table.insert(filter, t[k])
		end
	end
	return (filter)
	
end
-- 2. Function concatMax
--    Takes a string and an integer
--    Returns a string
--    If the given integer is less than the length of the given string
--    Returns the empty string

function pa2.concatMax(string,n)
	local len = string.len(string)
	local reps = math.floor(n/len)
	local newstring = string.rep(string,reps)
	return (newstring)
end

-- 3. Function collatz
--    Takes an integer parameter k
--    Returns an iterator that produces one or more integers

function pa2.collatz(k)
  
  local function iter(dummy1, dummy2)
    if k == 1 then
      k = 0
      return 1
    end
    while k > 1 do
      local v = k
      if (k % 2) == 0 then
        k = k / 2
      else
        k = (3 * k) + 1
      end
      return v
    end
  end
  return iter, nil, nil
end



-- 4. Coroutine substrings
--    Takes a single parameter s, which must be a string
--    Yields all substrings of s: first the unique length-zero substring,
--    then all length-one substrings, and so on, ending with s itself.

function pa2.substrings(s)
  local str = string.format(s)
  local n = string.len(s)
  coroutine.yield("")
  for i = 0, n - 1 do
    for j = 1, n - i do
      coroutine.yield(str:sub(j, j + 1))
    end
  end
  return str
end

return pa2