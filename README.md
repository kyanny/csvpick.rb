# csvpick.rb
Pick a column from a CSV file.

## Usage

```
csvpick.rb -c COLUMN < file.csv
```

`COLUMN` is a column name or a 0-based index (negative indices are supported).

## Examples

```sh
# By column name
csvpick.rb -c name < data.csv

# By index
csvpick.rb -c 0 < data.csv

# By negative index (last column)
csvpick.rb -c -1 < data.csv
```

> [!NOTE]
> The first row is always consumed as a header. If the input has no header row, the first data row will be silently lost.
> Workaround: `csvformat -H input.csv | csvpick.rb -c a`
