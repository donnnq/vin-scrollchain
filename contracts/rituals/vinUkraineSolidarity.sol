// SPDX-License-Identifier: UKR-SOLIDARITY
pragma solidity ^0.8.0;

/// @title vinUkraineSolidarity: Ritual scroll for sovereign defense and allied dignity
contract vinUkraineSolidarity {
    address public initiator;
    string public message = "For every border crossed without consent, we cast a line of defense bound by dignity.";

    struct SupportAction {
        string ally;
        string contribution;
        string impactStatement;
    }

    SupportAction[] public solidarityLog;

    event ActionRegistered(string ally, string contribution, string impactStatement);
    event ScrollActivated(string message);

    constructor() {
        initiator = msg.sender;
        emit ScrollActivated(message);
    }

    function registerAction(string memory ally, string memory contribution, string memory impactStatement) public {
        solidarityLog.push(SupportAction(ally, contribution, impactStatement));
        emit ActionRegistered(ally, contribution, impactStatement);
    }

    function viewSupportLog() public view returns (SupportAction[] memory) {
        return solidarityLog;
    }
}
