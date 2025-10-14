// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterHousingBroadcastDAO {
    address public admin;

    struct Broadcast {
        string city;
        string message;
        uint256 timestamp;
    }

    Broadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function issueBroadcast(string memory _city, string memory _message) external onlyAdmin {
        broadcasts.push(Broadcast(_city, _message, block.timestamp));
    }

    function getBroadcast(uint256 index) external view returns (Broadcast memory) {
        return broadcasts[index];
    }
}
