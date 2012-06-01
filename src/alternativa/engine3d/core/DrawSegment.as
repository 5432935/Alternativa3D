package alternativa.engine3d.core {

	import alternativa.engine3d.materials.compiler.Procedure;
	import alternativa.engine3d.objects.Surface;
	import alternativa.engine3d.resources.Geometry;

	public class DrawSegment {

		public var object:Object3D;
		public var surface:Surface;
		public var geometry:Geometry;
		public var transformProcedure:Procedure;
		public var deltaTransformProcedure:Procedure;

		public var next:DrawSegment;

		private static var collector:DrawSegment;

		public static function create(surface:Surface, object:Object3D, geometry:Geometry):DrawSegment {
			var res:DrawSegment;
			if (collector != null) {
				res = collector;
				collector = collector.next;
				res.next = null;
			} else {
				//trace("new DrawUnit");
				res = new DrawSegment();
			}
			res.object = object;
			res.surface = surface;
			res.geometry = geometry;
			return res;
		}

		public static function destroy(element:DrawSegment):void {
			element.surface = null;
			element.geometry = null;
			element.transformProcedure = null;
			element.deltaTransformProcedure = null;
			element.next = collector;
			collector = element;
		}

	}
}
