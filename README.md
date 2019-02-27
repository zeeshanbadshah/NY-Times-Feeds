# NY-Times-Feeds

NY-Times-Feeds is a sample app using The New York Times Developer Network APIs.

## Getting Started

Clone this repo to your local machine or download

### Prerequisites

No third party lib are used. 
XCode and Swift are the only requirments.

## Running the tests

Fireup XCode and open NY-Times-Feeds workspace.
You shoulod find two projects
1) NewYorkTimes
2) NewYorkTimesTests

Open NewYorkTimesTests project
Open NewYorkTimesTests.swift

Find play button on gutter of each method
Play to stat test
Find the result if the test passed or failed

### setUp

Setups the test envirnment
Find UIStoryboard instance
```
storyBaord = UIStoryboard(name: "Main", bundle: nil)
```

### testHasMainVC

Find if storyBoard has MainVC
```
XCTAssertNotNil(mainVC,"No mainVC identifier found")
```

### testHasTableViewDataSource

Test if tableView has DataSource set
```
XCTAssertTrue(mainVC.tblView.dataSource is MainVC)
```

### ...


### testFeedsJsonParse

Test JSON pareser works fine. Mocked Networking has been used to test JSON parsing.


## Deployment

Need Simulator or Device to deploy.


* Hat tip to anyone whose code was used
* Inspiration
* etc
