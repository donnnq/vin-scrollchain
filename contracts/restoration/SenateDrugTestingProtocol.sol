// SPDX-License-Identifier: Civic-Restoration
pragma solidity ^0.8.0;

/// @title SenateDrugTestingProtocol
/// @author Vinvin
/// @notice Ritualizes mandatory random drug testing in the Philippine Senate

contract SenateDrugTestingProtocol {
    address public senateOversight;
    uint256 public lastTestTimestamp;
    mapping(address => bool) public testedSenators;
    mapping(address => bool) public flaggedResults;

    event DrugTestConducted(address senator, bool result);
    event OversightUpdated(address newOversight);

    constructor(address _oversight) {
        senateOversight = _oversight;
    }

    function conductTest(address senator, bool result) public {
        require(msg.sender == senateOversight, "Unauthorized scrollsmith");
        testedSenators[senator] = true;
        lastTestTimestamp = block.timestamp;

        if (result == true) {
            flaggedResults[senator] = true;
        }

        emit DrugTestConducted(senator, result);
    }

    function updateOversight(address newOversight) public {
        require(msg.sender == senateOversight, "Only current oversight can update");
        senateOversight = newOversight;
        emit OversightUpdated(newOversight);
    }

    function isFlagged(address senator) public view returns (bool) {
        return flaggedResults[senator];
    }
}
