// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisinformationRecoveryPoetryManifest {
    address public steward;

    struct PoemEntry {
        string poemTitle;
        string author;
        string timestamp;
        string traumaReference;
        string emotionalTag;
    }

    PoemEntry[] public manifest;

    event RecoveryPoemBroadcasted(string poemTitle, string author, string timestamp, string traumaReference, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPoem(
        string memory poemTitle,
        string memory author,
        string memory timestamp,
        string memory traumaReference,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(PoemEntry(poemTitle, author, timestamp, traumaReference, emotionalTag));
        emit RecoveryPoemBroadcasted(poemTitle, author, timestamp, traumaReference, emotionalTag);
    }
}
