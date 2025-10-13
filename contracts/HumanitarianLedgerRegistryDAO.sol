// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HumanitarianLedgerRegistryDAO
 * @dev Emotionally tagged smart contract to log aid flows,
 * resource tracking, and dignity restoration rituals — scrollchain-sealed consequence.
 */

contract HumanitarianLedgerRegistryDAO {
    address public steward;

    struct AidLedger {
        address initiator;
        string region;
        string aidType; // "Food", "Medical", "Shelter", "Cash"
        uint256 quantity;
        string emotionalTag;
        uint256 timestamp;
    }

    AidLedger[] public events;

    event AidLogged(address indexed initiator, string region, string aidType, uint256 quantity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log humanitarian ledger rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAid(address initiator, string memory region, string memory aidType, uint256 quantity, string memory emotionalTag) external onlySteward {
        events.push(AidLedger({
            initiator: initiator,
            region: region,
            aidType: aidType,
            quantity: quantity,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AidLogged(initiator, region, aidType, quantity, emotionalTag, block.timestamp);
    }

    function getAidByIndex(uint256 index) external view returns (address initiator, string memory region, string memory aidType, uint256 quantity, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AidLedger memory a = events[index];
        return (a.initiator, a.region, a.aidType, a.quantity, a.emotionalTag, a.timestamp);
    }
}
