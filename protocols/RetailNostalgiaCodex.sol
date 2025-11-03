// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailNostalgiaCodex {
    address public steward;

    struct NostalgiaEntry {
        string storeName;
        string vibeTrigger;
        string memoryFlashback;
        string emotionalTag;
    }

    NostalgiaEntry[] public codex;

    event RetailNostalgiaLogged(string storeName, string vibeTrigger, string memoryFlashback, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logNostalgia(
        string memory storeName,
        string memory vibeTrigger,
        string memory memoryFlashback,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(NostalgiaEntry(storeName, vibeTrigger, memoryFlashback, emotionalTag));
        emit RetailNostalgiaLogged(storeName, vibeTrigger, memoryFlashback, emotionalTag);
    }
}
