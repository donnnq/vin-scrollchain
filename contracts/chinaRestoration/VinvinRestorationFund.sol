// nano path: contracts/chinaRestoration/VinvinRestorationFund.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title Vinvin Restoration Fund
/// @notice Steward-led blessing protocol for verified citizens with traceable dignity logs
contract VinvinRestorationFund {
    address public steward;

    mapping(address => bool) public verifiedCitizens;
    mapping(address => uint256) public blessings;

    event BlessingSent(address indexed citizen, uint256 amount);
    event CitizenVerified(address indexed citizen);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Only steward may perform this ritual.");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Verify a citizen to receive blessings
    /// @param citizen Address to verify
    function verifyCitizen(address citizen) external onlySteward {
        require(!verifiedCitizens[citizen], "Already verified.");
        verifiedCitizens[citizen] = true;
        emit CitizenVerified(citizen);
    }

    /// @notice Bless a verified citizen with a specified amount
    /// @param citizen Address of the recipient
    /// @param amount Amount of blessing (in wei)
    function bless(address citizen, uint256 amount) external onlySteward {
        require(verifiedCitizens[citizen], "Citizen not verified.");
        require(amount > 0, "Blessing must be greater than zero.");

        blessings[citizen] += amount;
        emit BlessingSent(citizen, amount);
    }

    /// @notice Retrieve total blessings received by a citizen
    /// @param citizen Address to query
    /// @return Total blessing amount
    function getBlessing(address citizen) external view returns (uint256) {
        return blessings[citizen];
    }

    /// @notice Check if a citizen is verified
    /// @param citizen Address to check
    /// @return True if verified, false otherwise
    function isVerified(address citizen) external view returns (bool) {
        return verifiedCitizens[citizen];
    }
}
