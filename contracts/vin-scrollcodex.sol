// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollCodex {
    struct Scroll {
        string name;
        string purpose;
        string zone;
        address deployedAt;
        uint256 timestamp;
    }

    Scroll[] public scrollRegistry;

    // Indexes for fast querying
    mapping(string => uint256[]) private zoneToIndices;
    mapping(string => uint256[]) private purposeToIndices;

    // Tagging system
    mapping(string => uint256[]) private tagToScrolls;
    mapping(uint256 => string[]) private scrollTags;

    event ScrollRegistered(
        string indexed name,
        address indexed deployedAt,
        string indexed zone
    );
    event ScrollTagged(uint256 indexed index, string tag);

    /// @notice Register a new scroll in the codex
    function registerScroll(
        string memory _name,
        string memory _purpose,
        string memory _zone,
        address _deployedAt
    ) public {
        uint256 index = scrollRegistry.length;
        scrollRegistry.push(
            Scroll({
                name: _name,
                purpose: _purpose,
                zone: _zone,
                deployedAt: _deployedAt,
                timestamp: block.timestamp
            })
        );

        zoneToIndices[_zone].push(index);
        purposeToIndices[_purpose].push(index);

        emit ScrollRegistered(_name, _deployedAt, _zone);
    }

    /// @notice Tag an existing scroll with arbitrary labels
    function tagScroll(uint256 index, string[] memory tags) public {
        require(index < scrollRegistry.length, "Index out of bounds");
        for (uint256 i = 0; i < tags.length; i++) {
            scrollTags[index].push(tags[i]);
            tagToScrolls[tags[i]].push(index);
            emit ScrollTagged(index, tags[i]);
        }
    }

    /// @notice Get total number of registered scrolls
    function totalScrolls() public view returns (uint256) {
        return scrollRegistry.length;
    }

    /// @notice Retrieve a scroll by its registry index
    function getScroll(uint256 index) public view returns (Scroll memory) {
        require(index < scrollRegistry.length, "Index out of bounds");
        return scrollRegistry[index];
    }

    /// @notice Fetch all scrolls in a given zone
    function getScrollsByZone(string memory zone)
        public
        view
        returns (Scroll[] memory)
    {
        uint256[] storage indices = zoneToIndices[zone];
        Scroll[] memory result = new Scroll[](indices.length);
        for (uint256 i = 0; i < indices.length; i++) {
            result[i] = scrollRegistry[indices[i]];
        }
        return result;
    }

    /// @notice Fetch all scrolls matching a purpose
    function getScrollsByPurpose(string memory purpose)
        public
        view
        returns (Scroll[] memory)
    {
        uint256[] storage indices = purposeToIndices[purpose];
        Scroll[] memory result = new Scroll[](indices.length);
        for (uint256 i = 0; i < indices.length; i++) {
            result[i] = scrollRegistry[indices[i]];
        }
        return result;
    }

    /// @notice Get all tags assigned to a scroll
    function getTags(uint256 index)
        public
        view
        returns (string[] memory)
    {
        require(index < scrollRegistry.length, "Index out of bounds");
        return scrollTags[index];
    }

    /// @notice Fetch all scroll indices that share a given tag
    function getScrollsByTag(string memory tag)
        public
        view
        returns (Scroll[] memory)
    {
        uint256[] storage indices = tagToScrolls[tag];
        Scroll[] memory result = new Scroll[](indices.length);
        for (uint256 i = 0; i < indices.length; i++) {
            result[i] = scrollRegistry[indices[i]];
        }
        return result;
    }

    /// @notice Echo all metadata plus tags for a given scroll
    function echoScrollDetails(uint256 index)
        public
        view
        returns (
            string memory name,
            string memory purpose,
            string memory zone,
            address deployedAt,
            uint256 timestamp,
            string[] memory tags
        )
    {
        require(index < scrollRegistry.length, "Index out of bounds");
        Scroll memory s = scrollRegistry[index];
        return (
            s.name,
            s.purpose,
            s.zone,
            s.deployedAt,
            s.timestamp,
            scrollTags[index]
        );
    }
}
