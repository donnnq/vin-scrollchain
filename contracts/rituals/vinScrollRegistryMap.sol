pragma solidity ^0.8.0;

contract vinScrollRegistryMap {
    struct ScrollMetadata {
        string scrollName;
        string archetype;
        string sigil;
        string ritualTag;
        uint256 timestamp;
    }

    ScrollMetadata[] public scrolls;
    mapping(string => uint256[]) private tagIndex;

    event ScrollRegistered(string scrollName, string ritualTag, uint256 indexed timestamp);

    function registerScroll(
        string memory _scrollName,
        string memory _archetype,
        string memory _sigil,
        string memory _ritualTag
    ) public {
        ScrollMetadata memory newScroll = ScrollMetadata({
            scrollName: _scrollName,
            archetype: _archetype,
            sigil: _sigil,
            ritualTag: _ritualTag,
            timestamp: block.timestamp
        });

        scrolls.push(newScroll);
        tagIndex[_ritualTag].push(scrolls.length - 1);

        emit ScrollRegistered(_scrollName, _ritualTag, block.timestamp);
    }

    function getScrollsByTag(string memory _ritualTag) public view returns (ScrollMetadata[] memory) {
        uint256[] memory indices = tagIndex[_ritualTag];
        ScrollMetadata[] memory taggedScrolls = new ScrollMetadata[](indices.length);

        for (uint256 i = 0; i < indices.length; i++) {
            taggedScrolls[i] = scrolls[indices[i]];
        }

        return taggedScrolls;
    }

    function getTotalScrolls() public view returns (uint256) {
        return scrolls.length;
    }
}
