// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRareEarthInfraTracker {
    address public infraArchitect;

    struct InfraProject {
        string name;
        string location;
        string partnerCountry;
        bool operational;
        uint256 timestamp;
    }

    InfraProject[] public infraLog;

    modifier onlyArchitect() {
        require(msg.sender == infraArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        infraArchitect = _architect;
    }

    function logProject(string memory name, string memory location, string memory partnerCountry, bool operational) external onlyArchitect {
        infraLog.push(InfraProject(name, location, partnerCountry, operational, block.timestamp));
    }

    function getAllProjects() external view returns (InfraProject[] memory) {
        return infraLog;
    }
}
