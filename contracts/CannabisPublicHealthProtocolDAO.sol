// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisPublicHealthProtocolDAO
 * @dev Emotionally tagged smart contract to trigger public health campaigns,
 * youth education, and harm reduction rituals — scrollchain-sealed awareness.
 */

contract CannabisPublicHealthProtocolDAO {
    address public steward;

    struct Campaign {
        address initiator;
        string region;
        string campaignType;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Campaign[] public campaigns;

    event PublicHealthCampaignActivated(address indexed initiator, string region, string campaignType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate public health campaigns");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateCampaign(address initiator, string memory region, string memory campaignType, string memory emotionalTag) external onlySteward {
        campaigns.push(Campaign({
            initiator: initiator,
            region: region,
            campaignType: campaignType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit PublicHealthCampaignActivated(initiator, region, campaignType, emotionalTag, block.timestamp);
    }

    function getCampaignByIndex(uint256 index) external view returns (address initiator, string memory region, string memory campaignType, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < campaigns.length, "Scrollstorm index out of bounds");
        Campaign memory c = campaigns[index];
        return (c.initiator, c.region, c.campaignType, c.emotionalTag, c.timestamp, c.activated);
    }
}
