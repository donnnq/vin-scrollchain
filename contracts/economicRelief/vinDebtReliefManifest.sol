// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinDebtReliefManifest.sol
/// @notice Caps interest rates and audits predatory lending behaviors

contract vinDebtReliefManifest {
    address public steward;
    uint256 public maxInterestRate; // in basis points (e.g., 2450 = 24.5%)

    struct Lender {
        string name;
        uint256 interestRate;
        bool isBlacklisted;
    }

    mapping(address => Lender) public lenders;

    event LenderAudited(address indexed lender, string name, uint256 interestRate, bool blacklisted);

    constructor(uint256 _maxRate) {
        steward = msg.sender;
        maxInterestRate = _maxRate;
    }

    function auditLender(address _lender, string memory _name, uint256 _rate) public {
        bool blacklist = _rate > maxInterestRate;
        lenders[_lender] = Lender(_name, _rate, blacklist);
        emit LenderAudited(_lender, _name, _rate, blacklist);
    }

    function getLender(address _lender) public view returns (Lender memory) {
        return lenders[_lender];
    }
}
