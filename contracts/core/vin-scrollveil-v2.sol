// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC1155 {
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;
}

contract VinScrollVeilV2 {
    struct VeiledScroll {
        string hiddenMeaning;
        uint256 requiredScrollId;
        uint256 requiredAmount;
        bool revealed;
    }

    VeiledScroll[] public veils;
    address public immutable scrollToken;
    address public immutable veilkeeper;

    event VeilCreated(uint256 indexed id, uint256 requiredScrollId, uint256 requiredAmount);
    event VeilRevealed(uint256 indexed id, address indexed revealer, string meaning);

    modifier onlyVeilkeeper() {
        require(msg.sender == veilkeeper, "Not the veilkeeper");
        _;
    }

    constructor(address _scrollToken) {
        scrollToken = _scrollToken;
        veilkeeper = msg.sender;
    }

    function createVeil(string calldata hiddenMeaning, uint256 requiredScrollId, uint256 requiredAmount) external onlyVeilkeeper {
        veils.push(VeiledScroll({
            hiddenMeaning: hiddenMeaning,
            requiredScrollId: requiredScrollId,
            requiredAmount: requiredAmount,
            revealed: false
        }));

        emit VeilCreated(veils.length - 1, requiredScrollId, requiredAmount);
    }

    function revealVeil(uint256 veilId) external {
        require(veilId < veils.length, "Invalid veil");
        VeiledScroll storage v = veils[veilId];
        require(!v.revealed, "Already revealed");

        IERC1155(scrollToken).safeTransferFrom(msg.sender, address(this), v.requiredScrollId, v.requiredAmount, "");

        v.revealed = true;
        emit VeilRevealed(veilId, msg.sender, v.hiddenMeaning);
    }

    function getVeilStatus(uint256 veilId) external view returns (bool revealed, uint256 requiredScrollId, uint256 requiredAmount) {
        require(veilId < veils.length, "Invalid veil");
        VeiledScroll storage v = veils[veilId];
        return (v.revealed, v.requiredScrollId, v.requiredAmount);
    }
}
