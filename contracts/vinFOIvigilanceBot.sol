// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface FOIContract {
    function getRequest(uint256 requestId) external view returns (
        address requester,
        string memory agency,
        string memory infoDescription,
        uint256 timestamp,
        bool fulfilled
    );
}

contract vinFOIvigilanceBot {
    address public scrollKeeper;
    FOIContract public foiFeed;
    string[] public bulletinBoard;

    event BroadcastTriggered(string message, uint256 indexed requestId);

    constructor(address foiAddress) {
        scrollKeeper = msg.sender;
        foiFeed = FOIContract(foiAddress);
    }

    function scanAndBroadcast(uint256 requestId) external {
        (
            address requester,
            string memory agency,
            string memory infoDescription,
            uint256 timestamp,
            bool fulfilled
        ) = foiFeed.getRequest(requestId);

        string memory message;
        if (fulfilled) {
            message = string(abi.encodePacked("✅ FOI fulfilled: ", agency, " - ", infoDescription));
        } else {
            message = string(abi.encodePacked("⚠️ FOI pending: ", agency, " - ", infoDescription));
        }

        bulletinBoard.push(message);
        emit BroadcastTriggered(message, requestId);
    }

    function getBulletin(uint256 index) external view returns (string memory) {
        return bulletinBoard[index];
    }

    function bulletinCount() external view returns (uint256) {
        return bulletinBoard.length;
    }
}
