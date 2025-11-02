// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivilForfeitureEthicsCodex {
    address public steward;

    struct ForfeitureClause {
        string assetName;
        string owner;
        string justification;
        string emotionalTag;
    }

    ForfeitureClause[] public codex;

    event AssetTagged(string assetName, string owner, string justification, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAsset(
        string memory assetName,
        string memory owner,
        string memory justification,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ForfeitureClause(assetName, owner, justification, emotionalTag));
        emit AssetTagged(assetName, owner, justification, emotionalTag);
    }
}
