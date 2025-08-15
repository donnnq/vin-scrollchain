// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract CoupleModule {
    address public steward;

    struct Couple {
        address partnerA;
        address partnerB;
        uint256 bondedAt;
        string vow;
    }

    Couple[] public soulbounds;

    event CoupleBonded(address indexed partnerA, address indexed partnerB, string vow, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function bondCouple(address partnerA, address partnerB, string memory vow) public onlySteward {
        soulbounds.push(Couple({
            partnerA: partnerA,
            partnerB: partnerB,
            bondedAt: block.timestamp,
            vow: vow
        }));

        emit CoupleBonded(partnerA, partnerB, vow, block.timestamp);
    }

    function getCouple(uint256 index) public view returns (
        address, address, uint256, string memory
    ) {
        Couple memory c = soulbounds[index];
        return (c.partnerA, c.partnerB, c.bondedAt, c.vow);
    }

    function totalCouples() public view returns (uint256) {
        return soulbounds.length;
    }
}
