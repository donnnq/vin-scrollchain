// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinDoOrDareTreaty
/// @notice Initiates a “Do or Dare” challenge ritual once a peace agreement is mutually confirmed.
contract vinDoOrDareTreaty {
    address public immutable scrollkeeper;
    address public immutable counterpart;

    bool public peaceConfirmed;
    string[] public dares;
    string[] public dos;
    mapping(address => string) public acceptedChallenge;

    event PeaceConfirmed(address indexed from, address indexed to);
    event ChallengeIssued(address indexed to, string challenge);

    modifier onlyParticipants() {
        require(msg.sender == scrollkeeper || msg.sender == counterpart, "Unauthorized");
        _;
    }

    constructor(address _counterpart) {
        scrollkeeper = msg.sender;
        counterpart = _counterpart;
    }

    /// @notice Confirm peace treaty from both sides
    function confirmPeace() external onlyParticipants {
        require(!peaceConfirmed, "Already confirmed");
        peaceConfirmed = true;
        emit PeaceConfirmed(scrollkeeper, counterpart);
    }

    /// @notice Add a new “Do” or “Dare” challenge
    function uploadChallenge(string calldata challenge, bool isDare) external onlyParticipants {
        require(peaceConfirmed, "Treaty not confirmed");
        if (isDare) {
            dares.push(challenge);
        } else {
            dos.push(challenge);
        }
    }

    /// @notice Choose and lock one challenge (Do or Dare)
    function acceptChallenge(bool chooseDare, uint256 index) external onlyParticipants {
        require(peaceConfirmed, "Peace required");
        string memory challenge = chooseDare ? dares[index] : dos[index];
        acceptedChallenge[msg.sender] = challenge;
        emit ChallengeIssued(msg.sender, challenge);
    }

    function getMyChallenge() external view returns (string memory) {
        return acceptedChallenge[msg.sender];
    }
}
