Tests and Coverage
================
11 October, 2018 08:36:01

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                            | Coverage (%) |
| :------------------------------------------------ | :----------: |
| snatools                                          |    80.72     |
| [R/adj\_list.R](../R/adj_list.R)                  |     0.00     |
| [R/adj\_matrix.R](../R/adj_matrix.R)              |     0.00     |
| [R/ei\_index.R](../R/ei_index.R)                  |     0.00     |
| [R/mix\_matrix.R](../R/mix_matrix.R)              |     0.00     |
| [R/utils.R](../R/utils.R)                         |    79.22     |
| [R/comparison.R](../R/comparison.R)               |    97.30     |
| [R/as\_bridge\_net.R](../R/as_bridge_net.R)       |    100.00    |
| [R/as\_igraph.R](../R/as_igraph.R)                |    100.00    |
| [R/as\_network.R](../R/as_network.R)              |    100.00    |
| [R/dataframe.R](../R/dataframe.R)                 |    100.00    |
| [R/edge-attributes.R](../R/edge-attributes.R)     |    100.00    |
| [R/edgelist.R](../R/edgelist.R)                   |    100.00    |
| [R/metadata.R](../R/metadata.R)                   |    100.00    |
| [R/vertex-attributes.R](../R/vertex-attributes.R) |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                                          |  n | time | error | failed | skipped | warning |
| :------------------------------------------------------------ | -: | ---: | ----: | -----: | ------: | ------: |
| [test-conversion.R](testthat/test-conversion.R)               | 15 | 0.72 |     0 |      0 |       0 |       0 |
| [test-dataframe.R](testthat/test-dataframe.R)                 | 56 | 0.16 |     0 |      0 |       0 |       0 |
| [test-edge-attributes.R](testthat/test-edge-attributes.R)     | 12 | 0.02 |     0 |      0 |       0 |       0 |
| [test-edgelist.R](testthat/test-edgelist.R)                   | 27 | 0.05 |     0 |      0 |       0 |       0 |
| [test-metadata.R](testthat/test-metadata.R)                   | 78 | 0.10 |     0 |      0 |       0 |       0 |
| [test-utils.R](testthat/test-utils.R)                         |  9 | 0.00 |     0 |      0 |       0 |       0 |
| [test-vertex-attributes.R](testthat/test-vertex-attributes.R) | 12 | 0.01 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                                  | context                                   | test                                                 | status |  n | time |
| :-------------------------------------------------------------------- | :---------------------------------------- | :--------------------------------------------------- | :----- | -: | ---: |
| [test-conversion.R](testthat/test-conversion.R#L15_L17)               | graph conversion                          | network objects convert to igraph correctly          | PASS   | 10 | 0.30 |
| [test-conversion.R](testthat/test-conversion.R#L89_L91)               | graph conversion                          | igraph objects convert to network correctly          | PASS   |  4 | 0.34 |
| [test-conversion.R](testthat/test-conversion.R#L107_L109)             | graph conversion                          | nested attributes and networkDynamic objects work    | PASS   |  1 | 0.08 |
| [test-dataframe.R](testthat/test-dataframe.R#L67_L70)                 | vertex/edge data frame construction works | vertex data frame construction works                 | PASS   |  6 | 0.02 |
| [test-dataframe.R](testthat/test-dataframe.R#L104_L107)               | vertex/edge data frame construction works | edge data frame construction works                   | PASS   |  6 | 0.03 |
| [test-dataframe.R](testthat/test-dataframe.R#L223_L226)               | vertex/edge data frame construction works | bipartite vertex data frame construction works       | PASS   |  4 | 0.02 |
| [test-dataframe.R](testthat/test-dataframe.R#L248_L251)               | vertex/edge data frame construction works | bipartite edge data frame construction works         | PASS   |  3 | 0.01 |
| [test-dataframe.R](testthat/test-dataframe.R#L282_L285)               | vertex/edge data frame construction works | handling 0 optional vertex columns works as expected | PASS   |  4 | 0.02 |
| [test-dataframe.R](testthat/test-dataframe.R#L313_L316)               | vertex/edge data frame construction works | vrt\_dfs from igraphs missing names work as expected | PASS   |  2 | 0.00 |
| [test-dataframe.R](testthat/test-dataframe.R#L343_L346)               | vertex/edge data frame construction works | handling 0 optional edge columns works as expected   | PASS   |  4 | 0.00 |
| [test-dataframe.R](testthat/test-dataframe.R#L369)                    | vertex/edge data frame construction works | nested attributes and networkDynamic objects work    | PASS   | 11 | 0.03 |
| [test-dataframe.R](testthat/test-dataframe.R#L385)                    | vertex/edge data frame construction works | empty graphs works                                   | PASS   | 16 | 0.03 |
| [test-edge-attributes.R](testthat/test-edge-attributes.R#L29_L32)     | edge attributes                           | attribute name extraction works                      | PASS   |  3 | 0.00 |
| [test-edge-attributes.R](testthat/test-edge-attributes.R#L48_L51)     | edge attributes                           | specific attribute extraction works                  | PASS   |  6 | 0.02 |
| [test-edge-attributes.R](testthat/test-edge-attributes.R#L85_L87)     | edge attributes                           | empty attributes return NULL                         | PASS   |  3 | 0.00 |
| [test-edgelist.R](testthat/test-edgelist.R#L92_L95)                   | edgelist construction works               | raw edgelists build properly                         | PASS   | 12 | 0.02 |
| [test-edgelist.R](testthat/test-edgelist.R#L153_L156)                 | edgelist construction works               | edgelist objects: use\_names = TRUE                  | PASS   |  6 | 0.01 |
| [test-edgelist.R](testthat/test-edgelist.R#L190_L193)                 | edgelist construction works               | edgelist objects: vrt\_attr = ‘foo’                  | PASS   |  6 | 0.02 |
| [test-edgelist.R](testthat/test-edgelist.R#L285_L288)                 | edgelist construction works               | raw bipartite edgelists build properly               | PASS   |  3 | 0.00 |
| [test-metadata.R](testthat/test-metadata.R#L58_L60)                   | metadata queries                          | net\_is\_directed is correct                         | PASS   |  6 | 0.00 |
| [test-metadata.R](testthat/test-metadata.R#L89_L91)                   | metadata queries                          | net\_is\_multiplex is correct                        | PASS   | 12 | 0.02 |
| [test-metadata.R](testthat/test-metadata.R#L140_L142)                 | metadata queries                          | net\_has\_loops is correct                           | PASS   | 12 | 0.01 |
| [test-metadata.R](testthat/test-metadata.R#L191_L193)                 | metadata queries                          | net\_has\_isolates is correct                        | PASS   | 12 | 0.02 |
| [test-metadata.R](testthat/test-metadata.R#L250_L253)                 | metadata queries                          | net\_count\_vertices is correct                      | PASS   | 12 | 0.02 |
| [test-metadata.R](testthat/test-metadata.R#L315_L318)                 | metadata queries                          | net\_count\_edges is correct                         | PASS   | 12 | 0.01 |
| [test-metadata.R](testthat/test-metadata.R#L389_L391)                 | metadata queries                          | net\_is\_bipartite works                             | PASS   |  6 | 0.02 |
| [test-metadata.R](testthat/test-metadata.R#L415_L418)                 | metadata queries                          | net\_count\_actors works                             | PASS   |  6 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L4_L6)                           | internal utility functions                | utils work as expected                               | PASS   |  9 | 0.00 |
| [test-vertex-attributes.R](testthat/test-vertex-attributes.R#L27_L30) | vertex attributes                         | attribute name extraction works                      | PASS   |  2 | 0.00 |
| [test-vertex-attributes.R](testthat/test-vertex-attributes.R#L41_L44) | vertex attributes                         | specific attribute extraction works                  | PASS   |  4 | 0.01 |
| [test-vertex-attributes.R](testthat/test-vertex-attributes.R#L61_L64) | vertex attributes                         | vertex name extraction works                         | PASS   |  2 | 0.00 |
| [test-vertex-attributes.R](testthat/test-vertex-attributes.R#L83_L85) | vertex attributes                         | empty attributes return NULL                         | PASS   |  4 | 0.00 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                            |
| :------- | :------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)     |
| Platform | x86\_64-w64-mingw32/x64 (64-bit) |
| Running  | Windows \>= 8 x64 (build 9200)   |
| Language | English\_United States           |
| Timezone | America/Los\_Angeles             |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.60  |

</details>

<!--- Final Status : pass --->