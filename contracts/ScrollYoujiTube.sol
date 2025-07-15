// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollYoujiTube
/// @notice Parody video platform for mascots, skits, lore docs, and crypto alerts
contract ScrollYoujiTube {
    address public owner;

    struct Content {
        uint256 id;
        address creator;
        string title;
        string uri;
        string category;
        uint256 timestamp;
    }

    uint256 public nextContentId;
    mapping(uint256 => Content) public contents;
    mapping(address => uint256[]) public creatorContents;

    event ContentUploaded(
        uint256 indexed id,
        address indexed creator,
        string title,
        string category
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Upload a parody skit, vlog, or alert video
    function uploadContent(
        string calldata title,
        string calldata uri,
        string calldata category
    ) external {
        contents[nextContentId] = Content(
            nextContentId,
            msg.sender,
            title,
            uri,
            category,
            block.timestamp
        );
        creatorContents[msg.sender].push(nextContentId);
        emit ContentUploaded(nextContentId, msg.sender, title, category);
        nextContentId++;
    }

    /// @notice Retrieve all content IDs uploaded by a specific creator
    function getContentsByCreator(address creator)
        external
        view
        returns (uint256[] memory)
    {
        return creatorContents[creator];
    }

    /// @notice Fetch the most recent `count` contents
    function getRecentContents(uint256 count)
        external
        view
        returns (Content[] memory)
    {
        uint256 start = nextContentId > count ? nextContentId - count : 0;
        uint256 len = nextContentId - start;
        Content[] memory slice = new Content[](len);
        for (uint256 i = 0; i < len; i++) {
            slice[i] = contents[start + i];
        }
        return slice;
    }
}
