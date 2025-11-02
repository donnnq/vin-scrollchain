// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityFragmentationMuseum {
    address public steward;

    struct FragmentEntry {
        string asset;
        string corridor;
        string fragmentationCause;
        string emotionalTag;
    }

    FragmentEntry[] public registry;

    event FragmentationArchived(string asset, string corridor, string fragmentationCause, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveFragmentation(
        string memory asset,
        string memory corridor,
        string memory fragmentationCause,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FragmentEntry(asset, corridor, fragmentationCause, emotionalTag));
        emit FragmentationArchived(asset, corridor, fragmentationCause, emotionalTag);
    }
}
