// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinCivicWitness.sol
/// @notice Allows verified community members to confirm or dispute infrastructure updates.

contract vinCivicWitness {
    address public curator;
    uint256 public witnessCount;

    struct Confirmation {
        uint256 id;
        address witness;
        string siteName;
        string comment;
        bool confirmed;
        uint256 timestamp;
    }

    mapping(uint256 => Confirmation) public confirmations;

    event ConfirmationSubmitted(uint256 indexed id, address witness, bool confirmed);

    modifier onlyCurator() {
        require(msg.sender == curator, "Not authorized.");
        _;
    }

    constructor() {
        curator = msg.sender;
    }

    function submitConfirmation(
        string memory _siteName,
        string memory _comment,
        bool _confirmed
    ) public {
        witnessCount++;
        confirmations[witnessCount] = Confirmation(
            witnessCount,
            msg.sender,
            _siteName,
            _comment,
            _confirmed,
            block.timestamp
        );
        emit ConfirmationSubmitted(witnessCount, msg.sender, _confirmed);
    }

    function viewConfirmation(uint256 _id) public view returns (Confirmation memory) {
        return confirmations[_id];
    }

    function totalConfirmations() public view returns (uint256) {
        return witnessCount;
    }
}
