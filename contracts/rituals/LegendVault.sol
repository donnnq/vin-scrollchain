// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IEmotionalLedger {
    function getLog(uint256 index) external view returns (
        uint256 timestamp,
        string memory ritual,
        string memory impact,
        address initiator
    );
    function totalLogs() external view returns (uint256);
}

contract LegendVault {
    address public steward;
    IEmotionalLedger public ledger;

    struct Legend {
        uint256 timestamp;
        string title;
        string description;
        address soulboundTo;
    }

    Legend[] public legends;

    event LegendMinted(uint256 indexed timestamp, string title, address indexed soulboundTo);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor(address _ledger) {
        steward = msg.sender;
        ledger = IEmotionalLedger(_ledger);
    }

    function mintLegend(uint256 logIndex, string memory title) public onlySteward {
        require(logIndex < ledger.totalLogs(), "Invalid log index");

        (
            uint256 timestamp,
            string memory ritual,
            string memory impact,
            address initiator
        ) = ledger.getLog(logIndex);

        Legend memory newLegend = Legend({
            timestamp: timestamp,
            title: title,
            description: string(abi.encodePacked(ritual, " — ", impact)),
            soulboundTo: initiator
        });

        legends.push(newLegend);
        emit LegendMinted(timestamp, title, initiator);
    }

    function getLegend(uint256 index) public view returns (
        uint256,
        string memory,
        string memory,
        address
    ) {
        Legend memory l = legends[index];
        return (l.timestamp, l.title, l.description, l.soulboundTo);
    }

    function totalLegends() public view returns (uint256) {
        return legends.length;
    }
}
