// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinFOItransparency {
    address public scrollKeeper;
    uint256 public totalRequests;

    struct FOIRequest {
        address requester;
        string agency;
        string infoDescription;
        uint256 timestamp;
        bool fulfilled;
    }

    mapping(uint256 => FOIRequest) public requests;

    event RequestFiled(uint256 indexed requestId, address indexed requester, string agency);
    event RequestFulfilled(uint256 indexed requestId);

    constructor() {
        scrollKeeper = msg.sender;
    }

    function fileRequest(string memory agency, string memory infoDescription) external {
        totalRequests++;
        requests[totalRequests] = FOIRequest({
            requester: msg.sender,
            agency: agency,
            infoDescription: infoDescription,
            timestamp: block.timestamp,
            fulfilled: false
        });

        emit RequestFiled(totalRequests, msg.sender, agency);
    }

    function fulfillRequest(uint256 requestId) external {
        require(msg.sender == scrollKeeper, "Only scrollKeeper can fulfill requests");
        requests[requestId].fulfilled = true;

        emit RequestFulfilled(requestId);
    }

    function getRequest(uint256 requestId) external view returns (FOIRequest memory) {
        return requests[requestId];
    }
}
