// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SariSariStoreEquityProtocolDAO {
    address public steward;

    struct StoreEvent {
        string storeName;
        string purok;
        string equityAction; // "Price Audit", "Supply Boost", "Digital Access"
        string emotionalTag;
        uint256 timestamp;
    }

    StoreEvent[] public events;

    event StoreLogged(
        string storeName,
        string purok,
        string equityAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log sari-sari equity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logStore(
        string memory storeName,
        string memory purok,
        string memory equityAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(StoreEvent({
            storeName: storeName,
            purok: purok,
            equityAction: equityAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit StoreLogged(storeName, purok, equityAction, emotionalTag, block.timestamp);
    }

    function getStoreByIndex(uint256 index) external view returns (
        string memory storeName,
        string memory purok,
        string memory equityAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        StoreEvent memory s = events[index];
        return (
            s.storeName,
            s.purok,
            s.equityAction,
            s.emotionalTag,
            s.timestamp
        );
    }
}
