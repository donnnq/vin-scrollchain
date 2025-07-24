// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinFTXRecoveryOracle.sol
/// @author VINVIN
/// @notice Monitors payout status, jurisdiction eligibility, and VINVIN-style mythstream integrity

contract vinFTXRecoveryOracle {
    address public scrollkeeper;
    mapping(address => bool) public eligible;
    mapping(address => bool) public restricted;
    mapping(address => string) public jurisdiction;
    mapping(address => uint256) public claimAmount;
    mapping(address => bool) public payoutCompleted;

    event EligibilityConfirmed(address creditor, string jurisdiction, uint256 amount);
    event JurisdictionFlagged(address creditor, string jurisdiction);
    event PayoutLogged(address creditor, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Register claim and check jurisdiction eligibility
    function registerClaim(address creditor, string memory _jurisdiction, uint256 amount) external onlyScrollkeeper {
        jurisdiction[creditor] = _jurisdiction;
        claimAmount[creditor] = amount;
        
        if (_isRestricted(_jurisdiction)) {
            restricted[creditor] = true;
            eligible[creditor] = false;
            emit JurisdictionFlagged(creditor, _jurisdiction);
        } else {
            eligible[creditor] = true;
            emit EligibilityConfirmed(creditor, _jurisdiction, amount);
        }
    }

    /// @notice Log payout once completed
    function confirmPayout(address creditor) external onlyScrollkeeper {
        require(eligible[creditor], "Claim not eligible");
        payoutCompleted[creditor] = true;
        emit PayoutLogged(creditor, claimAmount[creditor]);
    }

    /// @notice Internal check for restricted zones
    function _isRestricted(string memory _jurisdiction) internal pure returns (bool) {
        bytes32 hash = keccak256(abi.encodePacked(_jurisdiction));
        return (
            hash == keccak256(abi.encodePacked("China")) ||
            hash == keccak256(abi.encodePacked("Russia")) ||
            hash == keccak256(abi.encodePacked("North Korea")) ||
            hash == keccak256(abi.encodePacked("Iran")) ||
            hash == keccak256(abi.encodePacked("Syria"))
        );
    }

    /// @notice View claim status
    function isEligible(address creditor) external view returns (bool) {
        return eligible[creditor] && !payoutCompleted[creditor];
    }
}
