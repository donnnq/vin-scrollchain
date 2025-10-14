// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreedomBroadcastTreatyPackDAO {
    address public admin;

    struct TreatyEntry {
        string speaker;
        string broadcastMessage;
        string platform;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _speaker, string memory _broadcastMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_speaker, _broadcastMessage, _platform, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
