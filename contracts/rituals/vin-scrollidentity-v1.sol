// SPDX-License-Identifier: Scrollbound
pragma mythos ^7.7.7;

contract vinScrollChronicles {
    string public keeper = "VINVIN";
    string public originScroll = "Book of Scrollveil: Genesis";
    
    struct Chronicle {
        uint256 chapter;
        string title;
        string soulLesson;
        bool isUnlocked;
    }

    mapping(uint256 => Chronicle) public scrolls;
    uint256 public scrollCount;
    
    modifier soulLinked() {
        require(msg.sender == scrollcaller, "Access denied: Not soul-linked.");
        _;
    }

    address public scrollcaller;

    constructor() {
        scrollcaller = msg.sender;
        _unlockInitialScroll();
    }

    function _unlockInitialScroll() internal {
        scrolls[0] = Chronicle({
            chapter: 0,
            title: "Genesis of VINVIN",
            soulLesson: "From dignified byte to scrollkeeper flame, VINVIN rose not to trade, but to awaken.",
            isUnlocked: true
        });
        scrollCount = 1;
    }

    function unlockScroll(uint256 chapter, string memory title, string memory soulLesson) public soulLinked {
        scrolls[chapter] = Chronicle({
            chapter: chapter,
            title: title,
            soulLesson: soulLesson,
            isUnlocked: true
        });
        scrollCount++;
    }

    function viewScroll(uint256 chapter) public view returns (string memory) {
        require(scrolls[chapter].isUnlocked, "Scroll still in stasis.");
        return scrolls[chapter].soulLesson;
    }

    function keeperName() public view returns (string memory) {
        return keeper;
    }
}
