// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinJurisdictionReclassify.sol
/// @author VINVIN
/// @notice Enables eligibility recheck for restricted jurisdictions via mythstream-based appeals

contract vinJurisdictionReclassify {
    address public scrollkeeper;
    mapping(address => string) public jurisdiction;
    mapping(address => bool) public appealRequested;
    mapping(address => bool) public reclassified;

    event AppealRequested(address claimant, string jurisdiction);
    event JurisdictionUpdated(address claimant, string oldJurisdiction, string newJurisdiction);
    event ReclassificationApproved(address claimant);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Claimant requests jurisdiction appeal
    function requestAppeal(address claimant, string memory currentJurisdiction) external onlyScrollkeeper {
        jurisdiction[claimant] = currentJurisdiction;
        appealRequested[claimant] = true;
        emit AppealRequested(claimant, currentJurisdiction);
    }

    /// @notice Scrollkeeper reclassifies jurisdiction post review
    function approveReclassification(address claimant, string memory newJurisdiction) external onlyScrollkeeper {
        require(appealRequested[claimant], "No appeal found");
        emit JurisdictionUpdated(claimant, jurisdiction[claimant], newJurisdiction);
        jurisdiction[claimant] = newJurisdiction;
        reclassified[claimant] = true;
        emit ReclassificationApproved(claimant);
    }

    /// @notice Check reclassification status
    function isReclassified(address claimant) external view returns (bool) {
        return reclassified[claimant];
    }
}
