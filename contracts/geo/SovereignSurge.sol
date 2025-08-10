// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SovereignSurge - Ritual scroll for asserting provincial autonomy in global trade and diplomacy
/// @author Vinvin
/// @notice Tracks declarations of sovereignty and external engagements bypassing federal oversight

contract SovereignSurge {
    address public scrollsmith;

    struct Surge {
        string province;
        string declaration;
        string externalEntity;
        string justification;
        uint256 timestamp;
    }

    Surge[] public surges;

    event SurgeDeclared(string province, string externalEntity, string declaration);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function declareSurge(string calldata province, string calldata externalEntity, string calldata declaration, string calldata justification) external onlyScrollsmith {
        surges.push(Surge(province, declaration, externalEntity, justification, block.timestamp));
        emit SurgeDeclared(province, externalEntity, declaration);
    }

    function getAllSurges() external view returns (Surge[] memory) {
        return surges;
    }
}
