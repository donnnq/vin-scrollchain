// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ScrollIndex — Registry of Symbolic Permissions
 * @author VINVIN
 * @notice Catalogues scrolls like vin_license_ai_training.sol with origin, blessing, and hash trail.
 */

contract ScrollIndex {
    struct Scroll {
        string title;
        address scrollAddress;
        string blessing;
        uint256 timestamp;
        bytes32 hashTrail;
    }

    mapping(uint256 => Scroll) public index;
    uint256 public nextScrollId;

    event ScrollRegistered(uint256 indexed scrollId, string title, address scrollAddress);

    function registerScroll(
        string memory _title,
        address _scrollAddress,
        string memory _blessing
    ) public {
        bytes32 trail = keccak256(abi.encodePacked(_title, _scrollAddress, block.timestamp));
        index[nextScrollId] = Scroll(_title, _scrollAddress, _blessing, block.timestamp, trail);
        emit ScrollRegistered(nextScrollId, _title, _scrollAddress);
        nextScrollId++;
    }

    function getScroll(uint256 scrollId) external view returns (
        string memory title,
        address scrollAddress,
        string memory blessing,
        uint256 timestamp,
        bytes32 hashTrail
    ) {
        Scroll memory s = index[scrollId];
        return (s.title, s.scrollAddress, s.blessing, s.timestamp, s.hashTrail);
    }
}
