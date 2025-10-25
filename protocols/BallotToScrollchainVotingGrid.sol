// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotToScrollchainVotingGrid {
    address public steward;

    struct VotingEntry {
        string region; // "State", "City", "Diaspora zone"
        string ballotType; // "Cannabis reform", "Health equity", "Recall vote"
        string verificationMethod; // "Scrollchain ID", "Purok registry", "Diaspora witness"
        string emotionalTag;
        bool cast;
        bool sealed;
    }

    VotingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function castBallot(string memory region, string memory ballotType, string memory verificationMethod, string memory emotionalTag) external onlySteward {
        entries.push(VotingEntry(region, ballotType, verificationMethod, emotionalTag, true, false));
    }

    function sealVotingEntry(uint256 index) external onlySteward {
        require(entries[index].cast, "Must be cast first");
        entries[index].sealed = true;
    }

    function getVotingEntry(uint256 index) external view returns (VotingEntry memory) {
        return entries[index];
    }
}
