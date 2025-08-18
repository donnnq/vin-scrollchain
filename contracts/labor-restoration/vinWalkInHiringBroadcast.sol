// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinWalkInHiringBroadcast {
    string public broadcastName = "Walk-In Hiring Broadcast";
    string public steward = "Vinvin, Civic Architect";
    string public activationDate = "2025-08-18";
    string public glyph = "📜🏢👐🛠️";

    struct HiringPost {
        string companyName;
        string position;
        string location;
        string contactInfo;
        uint256 timestamp;
    }

    HiringPost[] public hiringBoard;

    event HiringPosted(string companyName, string position, string location, string contactInfo, uint256 timestamp);
    event CivicBroadcast(string message, uint256 timestamp);

    function postHiring(string memory _companyName, string memory _position, string memory _location, string memory _contactInfo) public {
        hiringBoard.push(HiringPost({
            companyName: _companyName,
            position: _position,
            location: _location,
            contactInfo: _contactInfo,
            timestamp: block.timestamp
        }));

        emit HiringPosted(_companyName, _position, _location, _contactInfo, block.timestamp);
        emit CivicBroadcast("Walk-in hiring posted. All stewards welcome.", block.timestamp);
    }

    function getHiringPost(uint256 index) public view returns (string memory, string memory, string memory, string memory, uint256) {
        require(index < hiringBoard.length, "Invalid index.");
        HiringPost memory post = hiringBoard[index];
        return (post.companyName, post.position, post.location, post.contactInfo, post.timestamp);
    }

    function broadcastWisdom() public pure returns (string memory) {
        return "No soul denied. No resume required. Every steward deserves a place to serve.";
    }
}
