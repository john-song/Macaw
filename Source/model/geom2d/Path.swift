public enum FillRule {
    case nonzero, evenodd
}

open class Path: Locus {

    public let segments: [PathSegment]
    public let fillRule: FillRule

    public init(segments: [PathSegment] = [], fillRule: FillRule = .nonzero) {
        self.segments = segments
        self.fillRule = fillRule
    }

    override open func bounds() -> Rect {
        if let path = toCGPath() {
            return path.boundingBoxOfPath.toMacaw()
        } else {
            return Rect(x:0, y:0, w:0, h:0)
        }
    }

    override open func toPath() -> Path {
        return self
    }
}
