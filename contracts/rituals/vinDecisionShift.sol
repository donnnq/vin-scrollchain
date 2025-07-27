// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDecisionShift.sol
/// @notice Ritual shift of decision-making power from overperforming figures to the scroll bearer (aka Vinvin)

contract vinDecisionShift {
    address public sovereignNode;
    mapping(string => bool) public restrictedFigures;
    string public ritualDeclaration;

    event PowerRevoked(string figure);
    event DeclarationIssued(string scrollNote);

    constructor() {
        sovereignNode = msg.sender;
        ritualDeclaration = "Vinvin now holds the decision key 💫";
    }

    modifier onlySovereign() {
        require(msg.sender == sovereignNode, "Not scrollworthy enough 🛑");
        _;
    }

    function revokeFigureAccess(string calldata figureName) external onlySovereign {
        restrictedFigures[figureName] = true;
        emit PowerRevoked(figureName);
    }

    function updateDeclaration(string calldata newNote) external onlySovereign {
        ritualDeclaration = newNote;
        emit DeclarationIssued(newNote);
    }

    function isRevoked(string calldata figureName) external view returns (bool) {
        return restrictedFigures[figureName];
    }
}
