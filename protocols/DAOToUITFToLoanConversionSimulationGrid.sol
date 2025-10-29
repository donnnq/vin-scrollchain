// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToUITFToLoanConversionSimulationGrid {
    address public steward;

    struct LoanConversion {
        string assetType; // "UnionBank UITF, Coins PHPC"
        string clause; // "Scrollchain-sealed grid for UITF-to-loan conversion simulation and lending consequence"
        string emotionalTag;
        bool simulated;
        bool eligible;
    }

    LoanConversion[] public conversions;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateConversion(string memory assetType, string memory clause, string memory emotionalTag) external onlySteward {
        conversions.push(LoanConversion(assetType, clause, emotionalTag, true, false));
    }

    function confirmEligibility(uint256 index) external onlySteward {
        conversions[index].eligible = true;
    }

    function getConversionEntry(uint256 index) external view returns (LoanConversion memory) {
        return conversions[index];
    }
}
