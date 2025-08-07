// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinCivicCompensator.sol
/// @notice Offers symbolic and financial restoration to scammed applicants.

contract vinCivicCompensator {
    address public guardian;
    uint256 public totalClaims;

    struct Claim {
        address claimant;
        string incidentDetails;
        uint256 reliefAmount;
        bool resolved;
    }

    mapping(uint256 => Claim) public claims;

    event ClaimFiled(uint256 indexed claimId, address indexed claimant);
    event CompensationReleased(uint256 indexed claimId, uint256 amount);

    modifier onlyGuardian() {
        require(msg.sender == guardian, "Not authorized.");
        _;
    }

    constructor() {
        guardian = msg.sender;
    }

    function fileClaim(string memory _details, uint256 _amount) public {
        claims[totalClaims] = Claim(msg.sender, _details, _amount, false);
        emit ClaimFiled(totalClaims, msg.sender);
        totalClaims++;
    }

    function releaseCompensation(uint256 _claimId) public onlyGuardian {
        Claim storage c = claims[_claimId];
        require(!c.resolved, "Already compensated.");
        c.resolved = true;
        emit CompensationReleased(_claimId, c.reliefAmount);
    }

    function viewClaim(uint256 _claimId) public view returns (Claim memory) {
        return claims[_claimId];
    }
}
