// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EpsteinFileTransparencyCodex {
    address public steward;

    struct TransparencyClause {
        string documentName;
        string corridor;
        string transparencyStatus;
        string emotionalTag;
    }

    TransparencyClause[] public codex;

    event FileTransparencyTagged(string documentName, string corridor, string transparencyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagTransparency(
        string memory documentName,
        string memory corridor,
        string memory transparencyStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TransparencyClause(documentName, corridor, transparencyStatus, emotionalTag));
        emit FileTransparencyTagged(documentName, corridor, transparencyStatus, emotionalTag);
    }
}
