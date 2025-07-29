// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinLawfulActions
/// @notice Enforces lawful, permissioned actions only—aligned with Law of Code doctrine
contract vinLawfulActions {
    address public scrollMaster;

    struct Action {
        string name;
        string jurisdiction;  // e.g. "UN Charter", "EU GDPR", "PH Cyberlaw"
        string intentStatement; // e.g. "Ensure food dignity", "Disable exploit vector"
        uint256 timestamp;
        address actor;
    }

    Action[] public actionLog;

    mapping(string => bool) public allowedJurisdictions;
    uint256 public totalActions;

    event LawfulActionCommitted(string name, string jurisdiction, string intentStatement, address actor);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "ScrollMaster required");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
        allowedJurisdictions["UN Charter"] = true;
        allowedJurisdictions["PH Cyberlaw"] = true;
        allowedJurisdictions["EU GDPR"] = true;
        allowedJurisdictions["AU Digital Act"] = true;
    }

    function commitAction(
        string memory name,
        string memory jurisdiction,
        string memory intentStatement
    ) public onlyScrollMaster {
        require(allowedJurisdictions[jurisdiction], "Jurisdiction not authorized");

        actionLog.push(Action(name, jurisdiction, intentStatement, block.timestamp, msg.sender));
        totalActions += 1;

        emit LawfulActionCommitted(name, jurisdiction, intentStatement, msg.sender);
    }

    function fetchAction(uint256 index) external view returns (Action memory) {
        require(index < actionLog.length, "Invalid index");
        return actionLog[index];
    }

    function isJurisdictionAllowed(string memory jurisdiction) public view returns (bool) {
        return allowedJurisdictions[jurisdiction];
    }

    function getTotalActions() external view returns (uint256) {
        return totalActions;
    }
}
