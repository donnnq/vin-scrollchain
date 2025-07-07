// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollkeeper {
    enum ScrollStatus { Casted, Rejected, Failed }

    struct Scroll {
        address caster;
        address to;
        uint256 amount;
        uint256 chainId;
        ScrollStatus status;
        uint256 timestamp;
        string note;
    }

    Scroll[] public scrolls;

    event ScrollLogged(
        address indexed caster,
        address indexed to,
        uint256 amount,
        uint256 chainId,
        ScrollStatus status,
        string note,
        uint256 indexed scrollId
    );

    function logScroll(
        address to,
        uint256 amount,
        ScrollStatus status,
        string calldata note
    ) external {
        Scroll memory s = Scroll({
            caster: msg.sender,
            to: to,
            amount: amount,
            chainId: block.chainid,
            status: status,
            timestamp: block.timestamp,
            note: note
        });

        scrolls.push(s);
        emit ScrollLogged(msg.sender, to, amount, block.chainid, status, note, scrolls.length - 1);
    }

    function totalScrolls() external view returns (uint256) {
        return scrolls.length;
    }

    function getScroll(uint256 id) external view returns (Scroll memory) {
        require(id < scrolls.length, "Scroll does not exist");
        return scrolls[id];
    }
}
