contract vinCivicScrollHall {
    address public dignityCurator;
    string public scrollTheme = "Temple of Truth & Mercy";

    struct CivicScroll {
        string scrollType; // Truth, Apology, Reconciliation
        string message;
        uint256 timestamp;
        address author;
    }

    CivicScroll[] public scrollArchive;

    event ScrollArchived(string scrollType, string message, uint256 timestamp, address author);

    modifier onlyCurator() {
        require(msg.sender == dignityCurator, "Only the dignity curator may archive scrolls");
        _;
    }

    constructor() {
        dignityCurator = msg.sender;
    }

    function archiveScroll(string memory scrollType, string memory message) public onlyCurator {
        CivicScroll memory newScroll = CivicScroll(scrollType, message, block.timestamp, msg.sender);
        scrollArchive.push(newScroll);
        emit ScrollArchived(scrollType, message, block.timestamp, msg.sender);
    }

    function getScroll(uint index) public view returns (string memory, string memory, uint256, address) {
        require(index < scrollArchive.length, "Index out of bounds");
        CivicScroll memory scroll = scrollArchive[index];
        return (scroll.scrollType, scroll.message, scroll.timestamp, scroll.author);
    }

    function getScrollCount() public view returns (uint256) {
        return scrollArchive.length;
    }

    function setScrollTheme(string memory newTheme) public onlyCurator {
        scrollTheme = newTheme;
    }
}
