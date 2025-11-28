// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAdaptationLedger {
    string public batchID = "1321.9.168";
    string public steward = "Vinvin";

    address public admin;

    struct AdaptationAction {
        string project;     // seawall, cooling center, drainage upgrade
        string location;
        uint256 timestamp;
    }

    AdaptationAction[] public actions;

    event AdaptationLogged(string project, string location);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdaptation(string memory project, string memory location) public onlyAdmin {
        actions.push(AdaptationAction(project, location, block.timestamp));
        emit AdaptationLogged(project, location);
    }

    function getAdaptation(uint256 index) public view returns (string memory project, string memory location, uint256 timestamp) {
        AdaptationAction memory a = actions[index];
        return (a.project, a.location, a.timestamp);
    }
}
