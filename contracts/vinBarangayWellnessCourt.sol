// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBarangayWellnessCourt {
    address public courtAdmin;

    struct Court {
        string barangay;
        bool isAirConditioned;
        string sportTypes;
        uint256 usageTokensEarned;
    }

    mapping(string => Court) public courts;
    string[] public barangayList;

    event CourtActivated(string barangay);
    modifier onlyAdmin() { require(msg.sender == courtAdmin, "Restricted"); _; }

    constructor() { courtAdmin = msg.sender; }

    function deployCourt(string memory barangay, bool aircon, string memory sportTypes) public onlyAdmin {
        courts[barangay] = Court(barangay, aircon, sportTypes, 0);
        barangayList.push(barangay);
        emit CourtActivated(barangay);
    }

    function logUsage(string memory barangay, uint256 tokens) public onlyAdmin {
        courts[barangay].usageTokensEarned += tokens;
    }

    function listCourts() public view returns (string[] memory) {
        return barangayList;
    }

    function getCourt(string memory barangay) public view returns (Court memory) {
        return courts[barangay];
    }
}
