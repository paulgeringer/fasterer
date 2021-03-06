module Fasterer
  class Offense
    attr_reader :offense_name, :line_number

    alias_method :name, :offense_name
    alias_method :line, :line_number

    def initialize(offense_name, line_number)
      @offense_name = offense_name
      @line_number  = line_number
      explanation # Set explanation right away.
    end

    def explanation
      @explanation ||= EXPLANATIONS.fetch(offense_name)
    end

    EXPLANATIONS = {
      parallel_assignment:
        'Parallel assignment is slower than sequential assignment',

      rescue_vs_respond_to:
        'Don\'t rescue NoMethodError, rather check with respond_to?',

      module_eval:
        'Using module_eval is slower than define_method',

      shuffle_first_vs_sample:
        'Array#shuffle.first is slower than Array#sample',

      for_loop_vs_each:
        'For loop is slower than using each',

      each_with_index_vs_while:
        'Using each_with_index is slower than while loop',

      map_flatten_vs_flat_map:
        'Array#map.flatten(1) is slower than Array#flat_map',

      reverse_each_vs_reverse_each:
        'Array#reverese.each is slower than Array#reverse_each',

      select_first_vs_detect:
        'Array#select.first is slower than Array#detect',

      sort_vs_sort_by:
        'Enumerable#sort is slower than Enumerable#sort_by',

      fetch_with_argument_vs_block:
        'Hash#fetch with second argument is slower than Hash#fetch with block',

      keys_each_vs_each_key:
        'Hash#keys.each is slower than Hash#each_key',

      hash_merge_bang_vs_hash_brackets:
        'Hash#merge! with one argument is slower than Hash#[]',

      block_vs_symbol_to_proc:
        'Calling argumentless methods within blocks is slower than using symbol to proc',

      proc_call_vs_yield:
        'Calling blocks with call is slower than yielding',

      gsub_vs_tr:
        'Use tr instead of gsub when grepping plain strings'
    }

  end
end
