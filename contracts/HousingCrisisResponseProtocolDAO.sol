// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingCrisisResponseProtocolDAO {
    address public admin;

    struct Response {
        string city;
        string crisisType;
        string actionTaken;
        uint256 timestamp;
    }

    Response[] public responses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logResponse(string memory _city, string memory _crisisType, string memory _actionTaken) external onlyAdmin {
        responses.push(Response(_city, _crisisType, _actionTaken, block.timestamp));
    }

    function getResponse(uint256 index) external view returns (Response memory) {
        return responses[index];
    }
}
