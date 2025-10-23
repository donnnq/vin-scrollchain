// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorReformBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string vendorName;
        string reformSignal; // "Price rollback", "Transparency pledge", "Barangay partnership"
        string broadcastChannel; // "Radio", "Facebook Live", "Community bulletin"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastReform(string memory vendorName, string memory reformSignal, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(vendorName, reformSignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
