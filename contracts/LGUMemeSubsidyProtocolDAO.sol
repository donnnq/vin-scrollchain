// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LGUMemeSubsidyProtocolDAO {
    address public steward;

    struct SubsidyEvent {
        string memeTitle;
        string LGUName;
        string crisisTrigger; // "Calamity", "Eviction", "Medical Emergency"
        string subsidyType; // "Food Pack", "Cash Aid", "Health Voucher"
        string emotionalTag;
        uint256 timestamp;
    }

    SubsidyEvent[] public events;

    event SubsidyLogged(
        string memeTitle,
        string LGUName,
        string crisisTrigger,
        string subsidyType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log LGU meme subsidy rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSubsidy(
        string memory memeTitle,
        string memory LGUName,
        string memory crisisTrigger,
        string memory subsidyType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SubsidyEvent({
            memeTitle: memeTitle,
            LGUName: LGUName,
            crisisTrigger: crisisTrigger,
            subsidyType: subsidyType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SubsidyLogged(memeTitle, LGUName, crisisTrigger, subsidyType, emotionalTag, block.timestamp);
    }

    function getSubsidyByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory LGUName,
        string memory crisisTrigger,
        string memory subsidyType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SubsidyEvent memory s = events[index];
        return (
            s.memeTitle,
            s.LGUName,
            s.crisisTrigger,
            s.subsidyType,
            s.emotionalTag,
            s.timestamp
        );
    }
}
